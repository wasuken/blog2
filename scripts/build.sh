rm app/assets/javascripts/**/*.js
babel --presets react,es2015 src/ -d app/assets/javascripts/
browserify app/assets/javascripts/index.js -o app/assets/javascripts/bundle.js
