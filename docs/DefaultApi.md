# MyNJ::DefaultApi

All URIs are relative to *https://example.com/mynjapi/authz*

| Method                                                     | HTTP request             | Description |
| ---------------------------------------------------------- | ------------------------ | ----------- |
| [**grant_post**](DefaultApi.md#grant_post)                 | **POST** /grant          |
| [**revoke_post**](DefaultApi.md#revoke_post)               | **POST** /revoke         |
| [**status_auth_id_get**](DefaultApi.md#status_auth_id_get) | **GET** /status/{authID} |
| [**update_post**](DefaultApi.md#update_post)               | **POST** /update         |

# **grant_post**

> MynjAuth grant_post(bodymy_nj_admin_user_key)

Request that myNJ create an authorization to grant a role and associated user key (unique identifier) to a person. If the response object's Success property is true, myNJ will have sent an email invitation to the specified address, containing instructions and a one-time authorization code or \"PIN\". In that case, the caller must store the response AuthID for later revocation or updates.

### Example

```ruby
# load the gem
require 'my_nj'
# setup authorization
MyNJ.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['Authorization'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['Authorization'] = 'Bearer'
end

api_instance = MyNJ::DefaultApi.new
body = MyNJ::Grant.new # Grant |
my_nj_admin_user_key = 'my_nj_admin_user_key_example' # String | UserKey (unique identifier) in the agency app's datastore for the administrator (the person whose actions in the app's user administration module triggered this call to the myNJ API).


begin
  result = api_instance.grant_post(bodymy_nj_admin_user_key)
  p result
rescue MyNJ::ApiError => e
  puts "Exception when calling DefaultApi->grant_post: #{e}"
end
```

### Parameters

| Name                     | Type                  | Description                                                                                                                                                                                       | Notes |
| ------------------------ | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----- |
| **body**                 | [**Grant**](Grant.md) |                                                                                                                                                                                                   |
| **my_nj_admin_user_key** | **String**            | UserKey (unique identifier) in the agency app&#x27;s datastore for the administrator (the person whose actions in the app&#x27;s user administration module triggered this call to the myNJ API). |

### Return type

[**MynjAuth**](MynjAuth.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

# **revoke_post**

> MynjAuth revoke_post(bodymy_nj_admin_user_key)

Revoke an existing authorization. This method must be called when the user identified in the authorization should no longer have access to your application. Unaccepted invitations can also be revoked.

### Example

```ruby
# load the gem
require 'my_nj'
# setup authorization
MyNJ.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['Authorization'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['Authorization'] = 'Bearer'
end

api_instance = MyNJ::DefaultApi.new
body = MyNJ::Revoke.new # Revoke |
my_nj_admin_user_key = 'my_nj_admin_user_key_example' # String | UserKey (unique identifier) in the agency app's datastore for the administrator (the person whose actions in the app's user administration module triggered this call to the myNJ API).


begin
  result = api_instance.revoke_post(bodymy_nj_admin_user_key)
  p result
rescue MyNJ::ApiError => e
  puts "Exception when calling DefaultApi->revoke_post: #{e}"
end
```

### Parameters

| Name                     | Type                    | Description                                                                                                                                                                                       | Notes |
| ------------------------ | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----- |
| **body**                 | [**Revoke**](Revoke.md) |                                                                                                                                                                                                   |
| **my_nj_admin_user_key** | **String**              | UserKey (unique identifier) in the agency app&#x27;s datastore for the administrator (the person whose actions in the app&#x27;s user administration module triggered this call to the myNJ API). |

### Return type

[**MynjAuth**](MynjAuth.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

# **status_auth_id_get**

> MynjAuthStatus status_auth_id_get(my_nj_admin_user_key, auth_id)

Get the status and other attributes of an existing authorization.

### Example

```ruby
# load the gem
require 'my_nj'
# setup authorization
MyNJ.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['Authorization'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['Authorization'] = 'Bearer'
end

api_instance = MyNJ::DefaultApi.new
my_nj_admin_user_key = 'my_nj_admin_user_key_example' # String | UserKey (unique identifier) in the agency app's datastore for the administrator (the person whose actions in the app's user administration module triggered this call to the myNJ API).
auth_id = 56 # Integer | ID of an authorization record returned by a prior call to grant.


begin
  result = api_instance.status_auth_id_get(my_nj_admin_user_key, auth_id)
  p result
rescue MyNJ::ApiError => e
  puts "Exception when calling DefaultApi->status_auth_id_get: #{e}"
end
```

### Parameters

| Name                     | Type        | Description                                                                                                                                                                                       | Notes |
| ------------------------ | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----- |
| **my_nj_admin_user_key** | **String**  | UserKey (unique identifier) in the agency app&#x27;s datastore for the administrator (the person whose actions in the app&#x27;s user administration module triggered this call to the myNJ API). |
| **auth_id**              | **Integer** | ID of an authorization record returned by a prior call to grant.                                                                                                                                  |

### Return type

[**MynjAuthStatus**](MynjAuthStatus.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

# **update_post**

> MynjAuth update_post(bodymy_nj_admin_user_key)

Update an existing authorization. Any fields omitted from the request will not be changed. The AuthID may not be omitted and cannot be changed. Some other fields may not be able to be changed, depending on the status of the authorization. The user key, email and names fields can be changed if the invitation has not been accepted. Only the user key (unique identifier) can be changed if the invitation has been accepted. The user key is the basis of single-signon, so its value must match in the user's record in the application database and in the user's myNJ account. No fields can be changed if the invitation has been revoked. It's not necessary or possible to update fields other than the user key in an accepted authorization, even if the user's name or email address have subsequently changed. At that point the authorization fields only serve as an audit record of where the invitation was sent and don't need to match the user's current name or address.

### Example

```ruby
# load the gem
require 'my_nj'
# setup authorization
MyNJ.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['Authorization'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['Authorization'] = 'Bearer'
end

api_instance = MyNJ::DefaultApi.new
body = MyNJ::Update.new # Update |
my_nj_admin_user_key = 'my_nj_admin_user_key_example' # String | UserKey (unique identifier) in the agency app's datastore for the administrator (the person whose actions in the app's user administration module triggered this call to the myNJ API).


begin
  result = api_instance.update_post(bodymy_nj_admin_user_key)
  p result
rescue MyNJ::ApiError => e
  puts "Exception when calling DefaultApi->update_post: #{e}"
end
```

### Parameters

| Name                     | Type                    | Description                                                                                                                                                                                       | Notes |
| ------------------------ | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----- |
| **body**                 | [**Update**](Update.md) |                                                                                                                                                                                                   |
| **my_nj_admin_user_key** | **String**              | UserKey (unique identifier) in the agency app&#x27;s datastore for the administrator (the person whose actions in the app&#x27;s user administration module triggered this call to the myNJ API). |

### Return type

[**MynjAuth**](MynjAuth.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json
