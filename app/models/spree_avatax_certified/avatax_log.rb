module SpreeAvataxCertified
  class AvataxLog
    attr_reader :logger

    def initialize(file_name, log_info = nil, schedule = nil)
      unless Spree::Config.avatax_log_to_stdout
        @logger ||= Logger.new(STDOUT)
        return
      end

      @logger ||= Logger.new(Rails.root.join('log', 'avatax.log'),
                             schedule.presence || 'weekly')

      progname(file_name.split('/').last.chomp('.rb'))
      info(log_info) if log_info
    end

    def enabled?
      Spree::Config.avatax_log || Spree::Config.avatax_log_to_stdout
    end

    def progname(progname = nil)
      return unless enabled?

      progname.nil? ? logger.progname : logger.progname = progname
    end

    def info(message, obj = nil)
      logger.info "[AVATAX] #{message} #{obj}" if enabled?
    end

    def debug(obj, message = '')
      logger.debug "[AVATAX] #{message} #{obj.inspect}" if enabled?
    end

    def error(obj, message = '')
      logger.error "[AVATAX] #{message} #{obj}" if enabled?
    end
  end
end
