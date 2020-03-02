module Xolphin
  module Api
    module Responses
      class Notes < Base
        def initialize(data)
          super(data)
        end

        def notes
          @notes ||= begin
            notes = []
            if _embedded && _embedded["notes"]
              _embedded["notes"].each do |note|
                notes << Note.new(note)
              end
            end
            notes
          end
        end
      end
    end
  end
end
