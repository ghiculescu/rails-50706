## Replication for https://github.com/rails/rails/pull/50706

To replicate, run `BACKTRACE=1 bin/rails test`. You should get output:

```
Error:
UserTest#test_can_create_user:
ActiveRecord::StatementInvalid: Could not find table 'delayed_jobs'
    rails (cff2eb1be11c) activerecord/lib/active_record/connection_adapters/sqlite3_adapter.rb:484:in `table_structure'
    rails (cff2eb1be11c) activerecord/lib/active_record/connection_adapters/abstract/schema_statements.rb:109:in `columns'
    rails (cff2eb1be11c) activerecord/lib/active_record/connection_adapters/schema_cache.rb:335:in `block in columns'
    rails (cff2eb1be11c) activerecord/lib/active_record/connection_adapters/schema_cache.rb:334:in `fetch'
    rails (cff2eb1be11c) activerecord/lib/active_record/connection_adapters/schema_cache.rb:334:in `columns'
    rails (cff2eb1be11c) activerecord/lib/active_record/connection_adapters/schema_cache.rb:343:in `block in columns_hash'
    rails (cff2eb1be11c) activerecord/lib/active_record/connection_adapters/schema_cache.rb:342:in `fetch'
    rails (cff2eb1be11c) activerecord/lib/active_record/connection_adapters/schema_cache.rb:342:in `columns_hash'
    rails (cff2eb1be11c) activerecord/lib/active_record/connection_adapters/schema_cache.rb:58:in `columns_hash'
    rails (cff2eb1be11c) activerecord/lib/active_record/connection_adapters/schema_cache.rb:184:in `columns_hash'
    rails (cff2eb1be11c) activerecord/lib/active_record/model_schema.rb:583:in `load_schema!'
    rails (cff2eb1be11c) activerecord/lib/active_record/counter_cache.rb:186:in `load_schema!'
    rails (cff2eb1be11c) activerecord/lib/active_record/encryption/encryptable_record.rb:127:in `load_schema!'
    rails (cff2eb1be11c) activerecord/lib/active_record/attribute_methods/primary_key.rb:157:in `load_schema!'
    rails (cff2eb1be11c) activerecord/lib/active_record/model_schema.rb:530:in `block in load_schema'
    rails (cff2eb1be11c) activerecord/lib/active_record/model_schema.rb:527:in `synchronize'
    rails (cff2eb1be11c) activerecord/lib/active_record/model_schema.rb:527:in `load_schema'
    rails (cff2eb1be11c) activerecord/lib/active_record/attribute_methods.rb:121:in `block in define_attribute_methods'
    rails (cff2eb1be11c) activerecord/lib/active_record/attribute_methods.rb:115:in `synchronize'
    rails (cff2eb1be11c) activerecord/lib/active_record/attribute_methods.rb:115:in `define_attribute_methods'
    rails (cff2eb1be11c) activerecord/lib/active_record/attribute_methods.rb:118:in `block in define_attribute_methods'
    rails (cff2eb1be11c) activerecord/lib/active_record/attribute_methods.rb:115:in `synchronize'
    rails (cff2eb1be11c) activerecord/lib/active_record/attribute_methods.rb:115:in `define_attribute_methods'
    rails (cff2eb1be11c) activerecord/lib/active_record/attribute_methods.rb:118:in `block in define_attribute_methods'
    rails (cff2eb1be11c) activerecord/lib/active_record/attribute_methods.rb:115:in `synchronize'
    rails (cff2eb1be11c) activerecord/lib/active_record/attribute_methods.rb:115:in `define_attribute_methods'
    rails (cff2eb1be11c) activerecord/lib/active_record/core.rb:775:in `init_internals'
    rails (cff2eb1be11c) activerecord/lib/active_record/persistence.rb:1143:in `init_internals'
    rails (cff2eb1be11c) activemodel/lib/active_model/dirty.rb:366:in `init_internals'
    rails (cff2eb1be11c) activerecord/lib/active_record/attribute_methods/dirty.rb:197:in `init_internals'
    rails (cff2eb1be11c) activerecord/lib/active_record/timestamp.rb:101:in `init_internals'
    rails (cff2eb1be11c) activerecord/lib/active_record/associations.rb:338:in `init_internals'
    rails (cff2eb1be11c) activerecord/lib/active_record/autosave_association.rb:277:in `init_internals'
    rails (cff2eb1be11c) activerecord/lib/active_record/transactions.rb:380:in `init_internals'
    rails (cff2eb1be11c) activerecord/lib/active_record/touch_later.rb:50:in `init_internals'
    rails (cff2eb1be11c) activerecord/lib/active_record/core.rb:453:in `initialize'
    rails (cff2eb1be11c) activerecord/lib/active_record/inheritance.rb:76:in `new'
    rails (cff2eb1be11c) activerecord/lib/active_record/inheritance.rb:76:in `new'
    delayed_job (4.1.11) lib/delayed/backend/base.rb:16:in `enqueue_job'
    delayed_job (4.1.11) lib/delayed/backend/base.rb:12:in `enqueue'
    delayed_job (4.1.11) lib/delayed/message_sending.rb:11:in `method_missing'
    test/models/user_test.rb:5:in `block in <class:UserTest>'
```

In the `Gemfile`, there is a commented out line that points to the last ref on Rails `main` before https://github.com/rails/rails/commit/d429bfb3b6fd2794f0d859b68e5dee24578d405f. If you use that ref, the tests pass.

```
% BACKTRACE=1 bin/rails test
Running 1 tests in a single process (parallelization threshold is 50)
Run options: --seed 44490

# Running:

.
```
