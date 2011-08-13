package Thorium::BuildConf::Roles::UI::FileSelect;

# ABSTRACT: dialog file select role

use Thorium::Protection;

use Moose::Role;

has 'ui_type' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'FileSelect'
);

no Moose::Role;

1;
