use inc::Module::Install;
name 'Plack-Session-Store-Cache-KyotoTycoon';
all_from 'lib/Plack/Session/Store/Cache/KyotoTycoon.pm';
readme_pod_from 'lib/Plack/Session/Store/Cache/KyotoTycoon.pm';
githubmeta;

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
