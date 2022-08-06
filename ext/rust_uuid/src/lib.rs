use magnus::{define_module, function, prelude::*, Error};
use rb_allocator::ruby_global_allocator;
use uuid::Uuid;

ruby_global_allocator!();

fn v4() -> String {
    Uuid::new_v4().to_string()
}

#[magnus::init]
fn init() -> Result<(), Error> {
    let module = define_module("RustUUID")?;
    module.define_singleton_method("v4", function!(v4, 0))?;
    Ok(())
}
