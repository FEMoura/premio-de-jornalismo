#!/bin/bash
git pull origin develop
git push origin develop
git checkout master
git pull origin master
git merge develop
git push origin master
git push server master
git checkout develop
