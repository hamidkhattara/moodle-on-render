<?php  // config.php
unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'pgsql';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'dpg-d1fsil7fte5s73fttd6g-a';
$CFG->dbname    = 'moodle_w3ml';
$CFG->dbuser    = 'moodleuser';
$CFG->dbpass    = 'CshKcXRJgZrKTcXLz2cFwfTkg9ohpd39';
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => 5432,
  'dbsocket' => '',
  'dbcollation' => 'utf8mb4_general_ci',
);

$CFG->wwwroot   = 'https://moodle-web-suc9.onrender.com';
$CFG->dataroot  = '/bitnami/moodledata';
$CFG->admin     = 'admin';

$CFG->directorypermissions = 0777;

require_once(__DIR__ . '/lib/setup.php');    
