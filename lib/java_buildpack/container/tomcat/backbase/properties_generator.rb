module JavaBuildpack
  module Container
    module Backbase
      class PropertiesGenerator
        def self.default_properties
          @default_properties ||= {
          :"foundation.environment.editorial" => "true",
          :"foundation.versioning.enabled" => "false",
          :"foundation.auditing" => "true",
          :"orchestrator.auditing" => "true",
          :"foundation.ptc.profile" => "ptc-local",
          :"foundation.exportimport.profile"=>"ps-exportimport-none",
          # :"foundation.exportimport.profile" => 'ps-exportimport-fs',
          # :"foundation.filesystem.contextroot" => 'backbase/portal/contextRoot',
          # :"foundation.exportimport.profile" => 'ps-exportimport-cs',
          :"contentservices.dbstore.max-size" => "2",
          :"orchestrator.name" => "Orchestrator",
          :"orchestrator.editorial" => "true",
          :"orchestrator.username" => ENV['orchestrator_username'],
          :"orchestrator.password" => ENV['orchestrator_password'],
          :"orchestrator.approvalgroups"=>"admin,manager,approvers",
          :"orchestrator.publishgroups"=>"admin,manager,publishers",
          :"orchestrator.orchestrators.names" => "Orchestrator",
          :"orchestrator.orchestrators.Orchestrator.address" => ENV['orchestrator_url'],
          :"orchestrator.orchestrators.Orchestrator.contextpath"=>"/",
          :"orchestrator.orchestrators.Orchestrator.username" => ENV['orchestrator_username'],
          :"orchestrator.orchestrators.Orchestrator.password" => ENV['orchestrator_password'],
          :"orchestrator.contenthost.name"=>"contentservices",
          :"orchestrator.contenthost.address" => ENV['orchestrator_url'],
          :"orchestrator.contenthost.contextpath"=>"/",
          :"orchestrator.contenthost.lockstrategy"=>"nooplocking",
          :"orchestrator.contenthost.atompath" => 'atom',
          :"orchestrator.contenthost.repositoryid"=>"contentRepository",
          :"orchestrator.contenthost.username" => ENV['contentservice_username'],
          :"orchestrator.contenthost.password" => ENV['contentservice_password'],
          :"orchestrator.portalhost.name" => "editorial",
          :"orchestrator.portalhost.address" => ENV['portalservice_url'],
          :"orchestrator.portalhost.contextpath"=>"/",
          :"orchestrator.portalhost.username" => ENV['portalservice_username'],
          :"orchestrator.portalhost.password" => ENV['portalservice_password'],
          :"foundation.content.proxy.username" => ENV['contentservice_username'],
          :"foundation.content.proxy.password" => ENV['contentservice_password'],
          :"foundation.orchestrator.proxy.username" => ENV['orchestrator_username'],
          :"foundation.orchestrator.proxy.password" => ENV['orchestrator_password'],
          :"foundation.database"=>"mysql",
          :"database.foundation.hibernate.dialect.class"=>"org.hibernate.dialect.MySQL5Dialect",
          :"auditing.database"=>"mysql",
          :"database.auditing.hibernate.dialect.class"=>"org.hibernate.dialect.MySQL5Dialect",
          :"contentservices.database"=>"mysql",
          :"contentservices.database.hibernate.dialect.class"=>"org.hibernate.dialect.MySQL5Dialect",
          :"orchestrator.database"=>"mysql",
          :"database.orchestrator.hibernate.dialect.class"=>"org.hibernate.dialect.MySQL5Dialect",
          :"foundation.content.proxy.destination" => ENV['contentservice_url'],
          :"foundation.orchestrator.proxy.destination" => ENV['orchestrator_url'],
          :"manager.solr.url" => ENV['solr_url'],

          :"orchestrator.configuration.location" => '.java-buildpack/tomcat/backbase/orchestrator/to-self-publishchains.xml',
          :"orchestrator.filestorelocation" => "backbase/orchestrator/fileStore",
          :"orchestrator.import.location" => 'backbase/orchestrator/import',
          :"orchestrator.export.location" => 'backbase/orchestrator/export',
          :"orchestrator.export.log.location" => 'backbase/orchestrator/export/logs',

          :"contentservices.repository.webdav.enabled" => "false",
          :"contentservices.importlocation" => 'backbase/content/import',
          :"contentservices.exportlocation" => 'backbase/content/export',
          :"contentservices.repository.content.fileLocation" => 'backbase/content/filesystem',

          :"orchestrator.orchestrators.Orchestrator.port" => "80",
          :"orchestrator.contenthost.port" => "80",
          :"orchestrator.portalhost.port" => "80",

          }
        end

        def self.properties
          # you can merge with other properties here
          default_properties
        end

        def self.save_properties_to_file(file_name)
          File.open(file_name, 'w') do |file|
            properties.each_pair do |key, value|
              if value
              	file.write("#{key}=#{value}\n")
              end
            end
          end
        end
      end
    end
  end
end
