# Author:: Brian Dupras (<bdupras@rallydev.com>)
# License:: Apache License, Version 2.0

require 'chef/knife'
require 'chef/knife/base_ovh_cloud_command'
require 'rbvmomi'
require 'netaddr'

class Chef::Knife::OvhCloudVmPropertyGet < Chef::Knife::BaseOvhCloudCommand
  banner "knife ovh cloud vm property get VMNAME PROPERTY.  Gets a vApp Property on VMNAME."

  get_common_options

  def run
    $stdout.sync = true
    vmname = @name_args[0]
    if vmname.nil?
      show_usage
      fatal_exit("You must specify a virtual machine name")
    end

    property_name = @name_args[1]
    if property_name.nil?
      show_usage
      fatal_exit("You must specify a PROPERTY name (e.g. annotation)")
    end
    property_name = property_name.to_sym

    vim = get_vim_connection

    dc = get_datacenter
    folder = find_folder(get_config(:folder)) || dc.vmFolder

    vm = find_in_folder(folder, RbVmomi::VIM::VirtualMachine, vmname) or
        abort "VM #{vmname} not found"

    existing_property = vm.config.vAppConfig.property.find { |p| p.props[:id] == property_name.to_s  }

    if existing_property
      puts existing_property.props[:value]
    else
      fatal_exit("PROPERTY [#{property_name.to_s}] not found")
    end

  end
end
