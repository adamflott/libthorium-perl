package Thorium::BuildConf::Roles::UI::InputBox;

# ABSTRACT: dialog input box role

use Thorium::Protection;

use Moose::Role;

has 'ui_type' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'InputBox'
);

no Moose::Role;

1;
