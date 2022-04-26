# frozen_string_literal: true

require_relative "../../application"

module Hanami
  module CLI
    module Commands
      module Monolith
        module DB
          class AbortIfPendingMigrations < Application
            desc "Abort if pending migrations"

            def call(**)
              return false if Dir[File.join(application.root, "db/migrate/*.rb")].empty?

              require "debug"
              binding.break
              abort "Migrations are pending" if database.migrations_pending?
            end
          end
        end
      end
    end
  end
end
