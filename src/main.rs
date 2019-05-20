use rdkafka::util::get_rdkafka_version;

fn main() {
    println!("Rdkafka version: {:?}", get_rdkafka_version());
}
