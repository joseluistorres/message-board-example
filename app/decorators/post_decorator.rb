class PostDecorator < Draper::Decorator
  delegate_all
  decorates_association :author
  decorates_association :comments
end