module FiveEmailWithRandomText
  extend ActiveSupport::Concern
  WORDS = 'Consider yourself a task I have ended. Our relationship, a 404 not found. Our connection now disconnected. You, a broken link I wish I had been forbidden to visit, a threat I did not initially detect. You became a virus in my system, and I had to Malware you out of it. I have now completed the uninstallation process, have reset my life’s device back to its original settings from before five years ago when I mistakenly trusted your download of lies. So good luck spamming your way into someone else’s unregistered trust—I have already reported your corrupted files.'
  def random_text
    words = WORDS.split(' ')
    words.sample(20).join(' ')
  end

  def five_email
    

  end
end
