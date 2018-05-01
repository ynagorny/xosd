# xosd
Ruby wrapper for xosd - X on screen display library

## libxosd version
The gem was designed for libxosd version 2.2.14 but likely to work with other versions too.

## Usage

### Constructor

Instantiate an instance of XOSD:

```
require 'xosd'

xosd = XOSD.new
```

You may pass zero or more of the options to the constructor:

| Option | Description |
| --- | --- |
| lines | max number of lines in the on screen message |
| :position | one of :top, :middle, :bottom |
| :align | one of :left, :center, :right |
| :colour | string with message color |
| :font | string with font |
| :horizontal_offset | horizontal message offset |
| :vertical_offset | vertical message offset |
| :outline_offset | message outline offset |
| :outline_colour | message outline color |
| :shadow_offset | message shadow offset |
| :shadow_colour | message shadow color |
| :bar_length | length of the percentage or slider bar |
| :timeout | how long the message is displayed, seconds |

All of the options have the corresponding setter, e.g. you can either:

```
xosd = XOSD.new(timeout: 5)
``` 

or

```
xosd = XOSD.new
xosd.timeout = 5
```

Example:

```
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
xosd.display_string 'A line to display on screen'
xosd.teardown
```

### Teardown

When done with displaying on screen messages, make sure to teardown the object by calling the teardown method:

```
xosd.teardown
```

If you don't do it, it will try to tear itself down during garbage collection, but you should not depend on it.

### Displaying a string

To display a string use display method:

```
xosd.display 'A message to display on screen'

```

You may use several lines:

```
xosd = XOSD.new(lines: 3)
xosd.display 'First line to display', line: 0
xosd.display 'Second line to display', line: 1
xosd.display 'Third line to display', line: 2
xosd.teardown
```

You may use #scroll_by to scroll the messages:

```
xosd.scroll_by 1
```


 
### Displaying a percentage bar

To display a bar similar to TV volume bar:

```
xosd = XOSD.new(bar_length: 100)
xosd.bar_length = 100 # same effect as above
xosd.display_bar 50
```

Use :bar_length constructor option or set bar_length later to define how long the bar will be.

### Displaying a slider

To display a slider similar to TV brightness control:

```
xosd.display_slider 50
```

Adjust slider length similar to how it is done for the percentage bar.

### On screen?

Call on_screen? method to find out if anything is being displayed on screen.

```
xosd.on_screen?
```

### Wait until message is gone

You may wait for the message to disappear using xosd_wait_until_no_display:

```
xosd.xosd_wait_until_no_display
```

### Hide and show

You may hide and show the last displayed message

```
xosd.dispaly 'A message'
xosd.hide
xosd.show
```

## Virtual machine for gem development
If you are interested in making changes to the gem, you may want to setup a virtual machine to assist with that.

* Install Virtual Box from https://www.virtualbox.org/
* Install Vagrant from https://www.vagrantup.com/
* Provision the virtual machine (it will be named xosd):

    $ vagrant up
    
* Add ssh info of the virtual machine to the ssh config:

    $ vagrant ssh-config >> ~/.ssh/config
    
* To open an ssh session with the virtual machine (the gem folder will be mounted under /vagrant):

    $ ssh -X xosd
    

   
