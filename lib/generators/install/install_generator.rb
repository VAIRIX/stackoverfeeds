require 'rails/generators'

module Stackoverfeeds
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)
      desc 'This generator prepare Stackoverfeeds to be used'

      def add_assets
        css_manifest = 'app/assets/stylesheets/application.css'

        if File.exist?(css_manifest)
          content = File.read(css_manifest)
          unless content.match(/require_tree\s+\.\s*$/) || content.match(/require stackoverfeeds\/feeds/)
            style_require_block = "\r\n*= require stackoverfeeds/feeds\r\n"
            insert_into_file css_manifest, style_require_block, :before => "*/"
          end
        else
          copy_file 'application.css', 'app/assets/stylesheets/application.css'
        end

        js_manifest = 'app/assets/javascripts/application.js'
        if File.exist?(js_manifest)
          content = File.read(js_manifest)
          unless content.match(/require_tree\s+\.\s*$/) || content.match(/require stackoverfeeds\/feeds/)
            js_require_block = "\r\n//= require stackoverfeeds/feeds"
            append_to_file js_manifest, js_require_block
          end
        else
          copy_file 'application.js', 'app/assets/javascripts/application.js'
        end
      end

      def add_styles
        copy_file 'feeds.css', 'app/assets/stylesheets/stackoverfeeds/feeds.css'
      end

      def add_scripts
        copy_file 'feeds.js', 'app/assets/javascripts/stackoverfeeds/feeds.js'
      end

      def add_config
        unless File.read('config/application.rb').match(/stackoverfeeds\/config.yml/)
          conf_manifest = 'config/stackoverfeeds/config.yml'
          env_update = "\r\nENV.update YAML.load(File.read(File.expand_path('../stackoverfeeds/config.yml', __FILE__)))\n"
          copy_file 'config.yml', conf_manifest
          append_to_file 'config/application.rb', env_update
        end
      end

      def copy_schedule
        copy_file 'schedule.rb', 'config/stackoverfeeds/schedule.rb'
      end

      def run_tasks
        exec('rake stackoverfeeds:install:migrations')
      end

    end
  end
end