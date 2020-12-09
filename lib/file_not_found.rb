# frozen_string_literal: true

# Custom Exceptions Should Inherit from StandardError Never rescue Exception
class FileNotFound < StandardError; end
