package Thorium::BuildConf::Roles::Knob;

# ABSTRACT: knob role

use Thorium::Protection;

use Moose::Role;

requires 'conf_key_name', 'name', 'question', 'value', 'data';

has 'explanation' => (
    'isa'           => 'Str',
    'is'            => 'rw',
    'required'      => 0,
    'documentation' => 'XXX'
);

no Moose::Role;

1;
