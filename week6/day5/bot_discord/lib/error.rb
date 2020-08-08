class RutherError
  def unknown_command(command)
    return "Sorry... I didn't understand that command argument: **#{ command  }**\n"
  end
end