class Orb
  class Error

    def self.from_status(status)
      case status
        when 400
          BadRequest
        when 401
          Unauthorized
        when 404
          SummonerNotFound
        when 500
          InternalServerError
        else
          ApiError
      end
    end

    class ApiError < StandardError; end

    # 400
    class BadRequest < ApiError; end

    # 401
    class Unauthorized < ApiError; end

    # 404
    class SummonerNotFound < ApiError; end

    # 500
    class InternalServerError < ApiError; end

    # No API errors
    class NotConfigured < StandardError; end
    class InvalidRegion < StandardError; end
  end
end
