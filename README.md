# Instructions

This project uses a custom Buildpack (APTFILES) on Heroku to work correctly.
This is what you need:


- Heroku redis
- Activate one Worker for Sidekiq
- `gem grim`
- ImageMagick
- GoogleMaps Browser API
- Cloudinary to handle image uploads

## Buildpacks
This is the one needed in order to work
https://elements.heroku.com/buildpacks/heroku/heroku-buildpack-apt


Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
