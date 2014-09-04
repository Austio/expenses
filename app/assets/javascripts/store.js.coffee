# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

App.Store = DS.Store.extend({

})

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
#App.ApplicationAdapter = DS.RESTAdapter.extend(headers: (->
#  API_KEY: @get(localStorage.token)
#).property(localStorage.token))

App.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  headers: {
    "API_KEY": localStorage.token
  }
})
#App.ApplicationAdapter = DS.ActiveModelAdapter.extend(headers: (->
#  API_KEY: @get("localStorage.token")
#).property("localStorage.token"))

DS.RESTAdapter.reopen
  namespace: 'api'