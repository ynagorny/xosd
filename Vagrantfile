Vagrant.configure('2') do |config|

  config.vm.define 'xosd' do |xosd|
    xosd.vm.box = 'ubuntu/trusty64'
    xosd.vm.hostname = 'xosd'
    xosd.vm.synced_folder "#{ENV['HOME']}/git/xosd", "/vagrant"
    xosd.vm.provision :shell, path: 'provision.sh'
    xosd.ssh.forward_x11 = true

    xosd.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", 512]
      vb.customize ["modifyvm", :id, "--name", "xosd"]
      vb.customize ["modifyvm", :id, "--usb", "off"]
    end
  end

end
