# frozen_string_literal: true

JWTSessions.encryption_key = 'secret'
JWTSessions.access_exp_time = 180 #3600 # 1 hour in seconds
JWTSessions.refresh_exp_time = 604800 # 1 week in seconds

Cetelem::Application.config.session_store :redis_store,
                                          servers: ["#{ENV['REDIS_URL']}/0/session"],
                                          expire_after: 90.minutes,
                                          key: "_#{Rails.application.class.module_parent_name.downcase}_session",
                                          threadsafe: true,
                                          signed: true,
                                          secure: true
