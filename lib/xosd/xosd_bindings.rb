require 'ffi'

module XOSD_Bindings
  extend FFI::Library
  ffi_lib ['xosd', 'libxosd.so.2']

  typedef :pointer, :osd

  enum :xosd_command, [:percentage, :string, :printf, :slider]

  enum :xosd_pos, [:top, :bottom, :middle]

  enum :xosd_align, [:left, :center, :right]

  attach_variable :xosd_error, :string
  attach_variable :osd_default_font, :string
  attach_variable :osd_default_colour, :string

  # xosd* xosd_create(int number_lines);
  attach_function :xosd_create, [:int], :osd

  # int xosd_destroy(xosd* osd);
  attach_function :xosd_destroy, [:osd], :int

  # int xosd_set_bar_length(xosd * osd, int length);
  attach_function :xosd_set_bar_length, [:osd, :int], :int

  # int xosd_display (xosd* osd, int line, xosd_command command, ...);
  attach_function :xosd_display, [:osd, :int, :varargs], :int

  # int xosd_is_onscreen(xosd* osd);
  attach_function :xosd_is_onscreen, [:osd], :int

  # int xosd_wait_until_no_display(xosd* osd);
  attach_function :xosd_wait_until_no_display, [:osd], :int

  # int xosd_hide (xosd* osd);
  attach_function :xosd_hide, [:osd], :int

  # int xosd_show (xosd* osd);
  attach_function :xosd_show, [:osd], :int

  # int xosd_set_pos (xosd* osd, xosd_pos pos);
  attach_function :xosd_set_pos, [:osd, :xosd_pos], :int

  # int xosd_set_align (xosd* osd, xosd_align align);
  attach_function :xosd_set_align, [:osd, :xosd_align], :int

  # int xosd_set_shadow_offset (xosd* osd, int shadow_offset);
  attach_function :xosd_set_shadow_offset, [:osd, :int], :int

  # int xosd_set_outline_offset(xosd * osd, int outline_offset);
  attach_function :xosd_set_outline_offset, [:osd, :int], :int

  # int xosd_set_outline_colour(xosd * osd, const char *colour);
  attach_function :xosd_set_outline_colour, [:osd, :string], :int

  # int xosd_set_shadow_colour(xosd * osd, const char *colour);
  attach_function :xosd_set_shadow_colour, [:osd, :string], :int

  # int xosd_set_horizontal_offset (xosd* osd, int offset);
  attach_function :xosd_set_horizontal_offset, [:osd, :int], :int

  # int xosd_set_vertical_offset (xosd* osd, int offset);
  attach_function :xosd_set_vertical_offset, [:osd, :int], :int

  # int xosd_set_timeout (xosd* osd, int timeout);
  attach_function :xosd_set_timeout, [:osd, :int], :int

  # int xosd_set_colour (xosd* osd, char* colour);
  attach_function :xosd_set_colour, [:osd, :string], :int

  # int xosd_set_font (xosd* osd, char* font);
  attach_function :xosd_set_font, [:osd, :string], :int

  # int xosd_get_colour (xosd* osd, int* red, int* green, int* blue);
  attach_function :xosd_get_colour, [:osd, :pointer, :pointer, :pointer], :int

  # int xosd_scroll (xosd* osd, int lines);
  attach_function :xosd_scroll, [:osd, :int], :int

  # int xosd_get_number_lines ( xosd* osd);
  attach_function :xosd_get_number_lines, [:osd], :int
end
