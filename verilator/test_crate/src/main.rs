use libloading::{Library, Symbol};

fn main() {
    let library = unsafe { Library::new("../obj_dir/libdynamic.so") }.expect("failed to get lib");
    let new_main: Symbol<extern "C" fn() -> *mut libc::c_void> =
        unsafe { library.get(b"new_main") }.expect("failed to get symbol");
    let eval: Symbol<extern "C" fn(*mut libc::c_void)> =
        unsafe { library.get(b"eval") }.expect("failed to get symbol");
    let set_single: Symbol<extern "C" fn(*mut libc::c_void, i32)> =
        unsafe { library.get(b"set_single") }.expect("failed to get symbol");
    let get_single: Symbol<extern "C" fn(*mut libc::c_void) -> i32> =
        unsafe { library.get(b"get_single") }.expect("failed to get symbol");

    let new_main = *new_main;
    let eval = *eval;
    let set_single = *set_single;
    let get_single = *get_single;

    let main = new_main();
    set_single(main, 1);
    println!("{}", get_single(main));
    eval(main);
    println!("{}", get_single(main));
}
