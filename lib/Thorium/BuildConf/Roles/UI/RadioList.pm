package Thorium::BuildConf::Roles::UI::RadioList;

# ABSTRACT: dialog radio list role

use Thorium::Protection;

use Moose::Role;

has 'ui_type' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'RadioList'
);

no Moose::Role;

1;
