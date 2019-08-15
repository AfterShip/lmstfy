# Lmstfy client

## Usage

### Initialize

```
import github.com/meitu/lmstfy/client

c := client.NewLmstfyClient(host, port, namespace, token)

c.ConfigRetry(3, 50) // optional, config the client to retry when some errors happened. retry 3 times with 50ms interval 
```

### Producer example

```
// Publish a job with ttl==forever, tries==3, delay==5s
jobID, err := c.Publish("q1", []byte("hello"), 0, 3, 5)
```

### Consumer example

```
// Consume a job from the q1, if there's not job availble, wait until 12s passed (polling).
// And if this consumer fail to ACK the job in 10s, the job can be retried by other consumers.
job, err := c.Consume("q1", 10, 12)
if err != nil {
    panic(err)
}

// Do something with the `job`
fmt.Println(string(job.Data))

err := c.Ack("q1", job.ID)
if err != nil {
    panic(err)
}
```