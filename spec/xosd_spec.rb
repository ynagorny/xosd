require 'xosd'

RSpec.describe XOSD do
  describe 'display string' do
    it 'displays string' do
      xosd = XOSD.new
      xosd.display 'A line to display'
      xosd.teardown
    end
    it 'displays multiple string lines and can scroll them' do
      xosd = XOSD.new(lines: 3)
      expect(xosd.lines).to eq 3
      xosd.display 'First line to display', line: 0
      xosd.display 'Second line to display', line: 1
      xosd.display 'Third line to display', line: 2
      xosd.scroll_by 1
      xosd.teardown
    end
    it 'displays string with options' do
      xosd = XOSD.new(
                     position: :bottom,
                     align: :center,
                     vertical_offset: 100,
                     font: '-*-arial-*-*-*-*-*-320-*-*-*-*-*-*',
                     colour: 'black',
                     outline_colour: 'orange',
                     outline_offset: 1,
                     shadow_colour: 'white',
                     shadow_offset: 1,
                     timeout: 3
      )
      xosd.display 'A line to display on screen'
      xosd.teardown
    end
  end
  describe 'display percentage' do
    it 'displays percentage bar' do
      xosd = XOSD.new(bar_length: 100)
      xosd.display_bar 50
      xosd.teardown
    end
  end
  describe 'display slider' do
    it 'displays slider' do
      xosd = XOSD.new
      xosd.bar_length = 100
      xosd.display_slider 50
      xosd.teardown
    end
  end
  describe 'on screen?' do
    it 'is true if something is displayed' do
      xosd = XOSD.new
      expect(xosd.on_screen?).to be_falsey
      xosd.display_slider 50
      expect(xosd.on_screen?).to be_truthy
      xosd.teardown
    end
  end
  describe 'xosd_wait_until_no_display' do
    it 'waits for the onscreen message to disappear' do
      xosd = XOSD.new(timeout: 1)
      xosd.display_slider 50
      expect(xosd.on_screen?).to be_truthy
      xosd.xosd_wait_until_no_display
      expect(xosd.on_screen?).to be_falsey
      xosd.teardown
    end
  end
  describe 'hide and show' do
    it 'hides and shows the message' do
      xosd = XOSD.new
      xosd.display_bar 25
      expect(xosd.on_screen?).to be_truthy
      xosd.hide
      sleep 0.1
      expect(xosd.on_screen?).to be_falsey
      xosd.show
      expect(xosd.on_screen?).to be_truthy
      xosd.teardown
    end
  end
end