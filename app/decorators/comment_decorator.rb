class CommentDecorator < Draper::Decorator
  delegate_all
  decorates_association :author
end