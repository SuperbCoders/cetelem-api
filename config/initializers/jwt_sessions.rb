# frozen_string_literal: true

JWTSessions.encryption_key = 'secret'
JWTSessions.access_exp_time = 30.days.to_i
JWTSessions.refresh_exp_time = 30.days.to_i

Cetelem::Application.config.session_store :redis_store,
                                          servers: ["#{ENV['REDIS_URL']}/0/session"],
                                          expire_after: 30.days.to_i,
                                          key: "_#{Rails.application.class.module_parent_name.downcase}_session",
                                          threadsafe: true,
                                          signed: true,
                                          secure: Rails.env.production?
