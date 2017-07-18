environment 	= :development 
#environment    = :production

# General settings
relative_assets = true      	# To enable relative paths to assets 
css_dir 		= "../_css"         
sass_dir 		= "../_sass" 
images_dir 		= "../_images"
preferred_syntax = :scss

# You can select your preferred output style here (can be overridden via the command line):
output_style = (environment == :development) ? :expanded : :compressed
