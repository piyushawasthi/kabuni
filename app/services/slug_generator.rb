#############################################################################################
# Shorten URL Generator
#############################################################################################

# module Services
  class SlugGenerator

    attr_accessor :link, :shorten

    # slug generator

    def initialize(link)
      @link  = link
      @success = nil
      @errors  = []
    end

    def process!
      binding.pry
      if @link.present?
        @link.shorten = @link.id.to_s(36)
        @link.save
        success!
        @error_message = nil
      else
        failure!
        @error_message ||= "Shorten URL Error."
      end
      self
    end

    private
    def success!
      @success = true
    end

    def failure!
      @success = false
    end
   
  end
# end