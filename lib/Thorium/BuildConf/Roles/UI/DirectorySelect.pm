package Thorium::BuildConf::Roles::UI::DirectorySelect;

# ABSTRACT: dialog directory selector role

use Thorium::Protection;

use Moose::Role;

has 'ui_type' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'DirectorySelect'
);

no Moose::Role;

1;
