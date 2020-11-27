Rails.application.configure do
    # MAIN
    config.cache_classes = false
    config.eager_load = false
    config.consider_all_requests_local = true

    # ASSETS
    config.assets.debug = true
    config.assets.quiet = true
    config.assets.js_compressor = Uglifier.new(harmony: true, output: { comments: :copyright })
    config.assets.css_compressor = :sass

    # OTHER
    config.cache_store = :null_store
    config.action_controller.perform_caching = false
    config.active_support.deprecation = :log
    config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
