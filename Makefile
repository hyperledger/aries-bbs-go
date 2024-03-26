.PHONY: all
all: checks unit-tests

.PHONY: checks
checks: check-deps
	@test -z $(shell gofmt -l -s $(shell go list -f '{{.Dir}}' ./...) | tee /dev/stderr) || (echo "Fix formatting issues"; exit 1)
	@go vet -all $(shell go list -f '{{.Dir}}' ./...)
	find . -name '*.go' | xargs addlicense -check || (echo "Missing license headers"; exit 1)

.PHONY: unit-tests
unit-tests:
	@go test -timeout 480s -cover $(shell go list ./...)

.PHONY: check-deps
check-deps:
	@go install github.com/google/addlicense@latest
