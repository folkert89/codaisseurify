module WaitForPageLoad

  def wait_until
    Timeout.timeout(10) do
      sleep(0.1) until value = yield
      value
    end
  end

end
