module InfluxDB
  class Query
    struct Result
      getter name : String
      getter tags : Tags
      getter fields : Fields

      def initialize(@name, @fields, @tags = Tags.new)
      end

      def time
        Time.parse_utc(@fields["time"].to_s, "%Y-%m-%dT%H:%M:%S.%6NZ")
      end

      def value
        @fields["value"]
      end
    end
  end
end
