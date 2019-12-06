module ExceptionsHelper
  def retry_known_exceptions(errors: [], retry_limit: 3, to_sleep: false, error_callback: nil)
    retries ||= 0

    yield
  rescue *errors => e
    if retries == retry_limit
      error_callback ? (return error_callback.call(e)) : raise(e)
    end

    sleep 2**retries if to_sleep
    retries += 1
    retry
  end
end
