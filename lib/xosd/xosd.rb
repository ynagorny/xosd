require_relative 'xosd_bindings'

class XOSD

  class XOSDError < StandardError; end

  def initialize(opts={})
    @osd = XOSD_Bindings.xosd_create opts[:lines]||1
    handle(-1) if @osd.null?
    ObjectSpace.define_finalizer(self, self.class.method(:finalize).to_proc)
    self.bar_length = opts[:bar_length] if opts[:bar_length]
    self.position = opts[:position] if opts[:position]
    self.align = opts[:align] if opts[:align]
    self.colour = opts[:colour] if opts[:colour]
    self.font = opts[:font] if opts[:font]
    self.horizontal_offset = opts[:horizontal_offset] if opts[:horizontal_offset]
    self.vertical_offset = opts[:vertical_offset] if opts[:vertical_offset]
    self.outline_offset = opts[:outline_offset] if opts[:outline_offset]
    self.outline_colour = opts[:outline_colour] if opts[:outline_colour]
    self.shadow_offset = opts[:shadow_offset] if opts[:shadow_offset]
    self.shadow_colour = opts[:shadow_colour] if opts[:shadow_colour]
    self.timeout = opts[:timeout] if opts[:timeout]
  end

  def teardown
    handle(XOSD_Bindings.xosd_destroy(@osd)) if @osd && !@osd.null?
    @osd = nil
  end

  def display(string, opts={line: 0})
    handle(XOSD_Bindings.xosd_display(@osd, opts[:line], :xosd_command, :string, :string, string))
  end

  def display_bar(percentage, opts={line: 0})
    handle(XOSD_Bindings.xosd_display(@osd, opts[:line], :xosd_command, :percentage, :int, percentage))
  end

  def display_slider(percentage, opts={line: 0})
    handle(XOSD_Bindings.xosd_display(@osd, opts[:line], :xosd_command, :slider, :int, percentage))
  end

  def on_screen?
    XOSD_Bindings.xosd_is_onscreen(@osd) != 0
  end

  def wait_until_no_display
    handle(XOSD_Bindings.xosd_wait_until_no_display(@osd))
  end

  def hide
    handle(XOSD_Bindings.xosd_hide(@osd))
  end

  def show
    handle(XOSD_Bindings.xosd_show(@osd))
  end

  def colour=(colour)
    handle(XOSD_Bindings.xosd_set_colour(@osd, colour))
  end

  def font=(font)
    handle(XOSD_Bindings.xosd_set_font(@osd, font))
  end

  # :top, :middle, :bottom
  def position=(position)
    handle(XOSD_Bindings.xosd_set_pos(@osd, position))
  end

  # :left, :center, :right
  def align=(align)
    handle(XOSD_Bindings.xosd_set_align(@osd, align))
  end

  def horizontal_offset=(offset)
    handle(XOSD_Bindings.xosd_set_horizontal_offset(@osd, offset))
  end

  def vertical_offset=(offset)
    handle(XOSD_Bindings.xosd_set_vertical_offset(@osd, offset))
  end

  def outline_offset=(offset)
    handle(XOSD_Bindings.xosd_set_outline_offset(@osd, offset))
  end

  def outline_colour=(colour)
    handle(XOSD_Bindings.xosd_set_outline_colour(@osd, colour))
  end

  def shadow_offset=(offset)
    handle(XOSD_Bindings.xosd_set_shadow_offset(@osd, offset))
  end

  def shadow_colour=(colour)
    handle(XOSD_Bindings.xosd_set_shadow_colour(@osd, colour))
  end

  def bar_length=(length)
    handle(XOSD_Bindings.xosd_set_bar_length(@osd, length))
  end

  def lines
    XOSD_Bindings.xosd_get_number_lines(@osd)
  end

  def timeout=(period)
    handle(XOSD_Bindings.xosd_set_timeout(@osd, period))
  end

  def scroll_by(lines)
    handle(XOSD_Bindings.xosd_scroll(@osd, lines))
  end

  private

  def self.finalize(id)
    ObjectSpace._id2re(id).teardown
  end

  def handle(result)
    raise XOSDError.new(XOSD_Bindings.xosd_error) if result == -1
  end

end