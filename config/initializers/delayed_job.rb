# this is a bit convoluted, it's needed to make DJ talk to a different database
#
# Delayed::Backend::ActiveRecord::Job is the class from https://github.com/collectiveidea/delayed_job_active_record/blob/master/lib/delayed/backend/active_record.rb
# DelayedJobAbstractParentClass is needed as `connects_to` can only be called on abstract classes
# DelayedJobImplementation is needed as DJ needs a non-abstract class to do stuff with
# Delayed::Worker.backend is where `Delayed::Job` is set: https://github.com/collectiveidea/delayed_job/blob/baed6e813870e1144e7a4291bc71e06a67a533de/lib/delayed/worker.rb#L64

class DelayedJobAbstractParentClass < Delayed::Backend::ActiveRecord::Job
  self.abstract_class = true
  connects_to database: { writing: :jobs, reading: :jobs }
end

class DelayedJobImplementation < DelayedJobAbstractParentClass; end

Delayed::Worker.backend = DelayedJobImplementation
