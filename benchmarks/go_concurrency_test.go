package benchmarks

import (
	"sync"
	"sync/atomic"
	"testing"
)

// BenchmarkGoroutineFanOut measures dispatching 100,000 goroutines with atomic counter
func BenchmarkGoroutineFanOut(b *testing.B) {
	for n := 0; n < b.N; n++ {
		var wg sync.WaitGroup
		var counter uint64
		numWorkers := 10000

		wg.Add(numWorkers)
		for i := 0; i < numWorkers; i++ {
			go func() {
				defer wg.Done()
				atomic.AddUint64(&counter, 1)
			}()
		}
		wg.Wait()
	}
}

// BenchmarkRWMutexSharded simulates multi-threaded cache reads
func BenchmarkRWMutexSharded(b *testing.B) {
	var mu sync.RWMutex
	data := make(map[int]int)

	b.RunParallel(func(pb *testing.PB) {
		i := 0
		for pb.Next() {
			i++
			if i%10 == 0 {
				mu.Lock()
				data[i] = i
				mu.Unlock()
			} else {
				mu.RLock()
				_ = data[i]
				mu.RUnlock()
			}
		}
	})
}
