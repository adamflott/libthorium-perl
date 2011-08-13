package Thorium::BuildConf::Roles::UI::Menu;

# ABSTRACT: dialog menu role

use Thorium::Protection;

use Moose::Role;

has 'ui_type' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'Menu'
);

no Moose::Role;

1;
