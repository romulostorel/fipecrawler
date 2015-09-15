Fipe Crawler
==============

[![Code Climate](https://codeclimate.com/github/romulostorel/fipecrawler/badges/gpa.svg)](https://codeclimate.com/github/romulostorel/fipecrawler)
[![Build Status](https://semaphoreci.com/api/v1/projects/0e64eca8-d682-4ee5-9525-74544931a36a/511974/badge.svg)](https://semaphoreci.com/romulostorel/fipecrawler)

Starting database
=================

Edit `.env` like:

    DATABASE_URL="postgres://postgres@localhost/fipe_development"

Run `rake db:migrate`:

    % rake db:migrate
    Migrating to latest

Console
=======

    % irb -r./irb -I./lib
    >> Importer::Brand.import
    >> Importer::Vehicle.import
