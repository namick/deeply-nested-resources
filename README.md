# Deeply Nested Resources

This is an example Rails app used to show [obfuscate_id](https://github.com/namick/obfuscate_id)'s use with nested resources.

I created this to flush out any bugs with `obfuscate_id` as reported in [this issue](https://github.com/namick/obfuscate_id/issues/6).  It turns out everything is working as expected.

This is not an example on how to build an app with or without obfuscate_id.  Check out the [excessive URL length](https://github.com/namick/deeply-nested-resources/blob/master/spec/features/nested_spec.rb#L63) and the [added complexity](https://github.com/namick/deeply-nested-resources/commit/1d8a7b4fbe6802135c120daa2afa515c3bb4ee42) to make it work.

Typically nesting resources should be restricted to a single level as [proposed](http://weblog.jamisbuck.org/2007/2/5/nesting-resources) by Jamis Buck and mentioned in the official [Rails Guide](http://guides.rubyonrails.org/routing.html#nested-resources).
