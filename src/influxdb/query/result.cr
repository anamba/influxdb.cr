module InfluxDB
  class Query
    struct Result
      getter name : String
      getter tags : Tags
      getter fields : Fields

      def initialize(@name, @fields, @tags = Tags.new)
      end

      def time : Time?
        if (t = @fields["time"]?) && (ts = t.to_s)
          case
          when ts =~ /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{6}Z$/
            Time.parse_utc(ts, "%Y-%m-%dT%H:%M:%S.%6NZ")
          else
            Time.parse_utc(ts, "%Y-%m-%dT%H:%M:%S")
          end
        end
      end

      def value
        @fields["value"]
      end
    end
  end
end
