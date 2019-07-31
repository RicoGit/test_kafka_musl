use rdkafka::util::get_rdkafka_version;
use rdkafka::consumer::BaseConsumer;
use rdkafka::ClientConfig;
use rdkafka::config::FromClientConfig;

fn main() {

    println!("Rdkafka version: {:?}", get_rdkafka_version());
    let mut conf = ClientConfig::new();
    conf.set("compression.type", "zstd");
    let consumer = BaseConsumer::from_config(&conf).unwrap();
    println!("Rdkafka consumer created");

}
