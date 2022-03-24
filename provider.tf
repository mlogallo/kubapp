#_______________________________________________________________
#
# Terraform Provider - Helm
# https://registry.terraform.io/providers/hashicorp/helm/latest
#_______________________________________________________________

provider "helm" {
  kubernetes {
    host                   = local.kubeconfig.clusters[0].cluster.server
    client_certificate     = base64decode(LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFekNDQWZ1Z0F3SUJBZ0lJQ2hzMDhLZE9ud2t3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TWpBek1qUXhOVEU1TlROYUZ3MHlNekF6TWpReE5URTVOVFZhTURReApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1Sa3dGd1lEVlFRREV4QnJkV0psY201bGRHVnpMV0ZrCmJXbHVNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQXZ0cVZkOEd6WFlJamdoUTQKcFQ2UDEvRis1TGVFOXdwMXhDeHJKajNUSnhXc3dwZFJyVEJBZndhbjViZWJXOXQzdlczY2NnR3ZqdmZ1QStnZgo4U3l3VDdxWnpOZURNcHBweFdvUjRDbUwzeVJTSk1hWEZMRVNQMFFMNjNtbEQyN0xScGVVV2ViYzcvMEp5ZEt4CjFUQnhoL1RGdnlGTG00WGVVR1EzZzJBSHhWTzVndFhmUzlUNXZNU3Z3aGF4bTdLWUZXRU1YSWdVMWVKUUdXT1UKeGhEejBYejRjTVNiYUZ5U0pMTFo4R2JCUy8yNUNBczFpZ2tMRjAyeE1wdUVlb0RXUENjQ3lXOXVsN3ZFV3VoZApTcnppUGJNZUkrLy9EN3F3dEx2TG1FSGVNK3E3bmdUMFNQU04rTnpldXJzQVZFREZiV3AyZHdvc3pVTHhKaEJ6CmVzZDd2UUlEQVFBQm8wZ3dSakFPQmdOVkhROEJBZjhFQkFNQ0JhQXdFd1lEVlIwbEJBd3dDZ1lJS3dZQkJRVUgKQXdJd0h3WURWUjBqQkJnd0ZvQVVuSks1a3NVMUtRb0t6ekZ6ZkovSk41cjBDcU13RFFZSktvWklodmNOQVFFTApCUUFEZ2dFQkFIemxJV2VnY2NqRCtNbHhkc1NUZXkwenpNWFo3Ry9JcXZvbHNZZUFScjJ4ejVMbUZlRGZQN2FKCnh2VXVUUm8zT2NuaG1kVXc5SE90MGVmN0d1ZlVydTJkZHR6U2VZamdPOHNldHhkc0RJSEIrNitJNytNU3o2OE0KbVVuWDBzSmJoRVdqZHZZbjN1RjJUMmoybVBJWE5mcnIzSURqRFNxRmJEM3VTTGRGbWpvODlIS29KaWdMT1BQNApreW4wVVh2MUJReElHcTZ2ZHNabEhwWFlybUZucHNwdExBc00rU0dEZWlvT21WOHo1K1gvbk50VmQxVHA1NUYyCmcyQ2NCd0tLaGRYYTMvYXBWNCs0N3kvZFpuSXJsQTAya0pHZm1ENGRFTGI3eTh3YXZvalRMdnpsS2RyQXc5ZXEKSlR2cDRLSkliUFBqRFFseFVYR3dmeTJDYXE5ZituVT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=)
    client_key             = base64decode(LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBdnRxVmQ4R3pYWUlqZ2hRNHBUNlAxL0YrNUxlRTl3cDF4Q3hySmozVEp4V3N3cGRSCnJUQkFmd2FuNWJlYlc5dDN2VzNjY2dHdmp2ZnVBK2dmOFN5d1Q3cVp6TmVETXBwcHhXb1I0Q21MM3lSU0pNYVgKRkxFU1AwUUw2M21sRDI3TFJwZVVXZWJjNy8wSnlkS3gxVEJ4aC9URnZ5RkxtNFhlVUdRM2cyQUh4Vk81Z3RYZgpTOVQ1dk1TdndoYXhtN0tZRldFTVhJZ1UxZUpRR1dPVXhoRHowWHo0Y01TYmFGeVNKTExaOEdiQlMvMjVDQXMxCmlna0xGMDJ4TXB1RWVvRFdQQ2NDeVc5dWw3dkVXdWhkU3J6aVBiTWVJKy8vRDdxd3RMdkxtRUhlTStxN25nVDAKU1BTTitOemV1cnNBVkVERmJXcDJkd29zelVMeEpoQnplc2Q3dlFJREFRQUJBb0lCQUdZRy9sNTkrNEFpb1E3Wgo5b3BJRHFlM1gwbXYzZkllOG1RRUJ1ZnpweHkrMXBOVVI0S1pSL0ZnUW9Ob2l6SW8rak1YTndEdmE4VzNQdE54CjFSbWQ5VWM2RHh4Vm5icUFsOGpFY25mdVhlclZST0NLRlp3bktRVVBRSHdLbExYU1dmTUw5MiswSGlwaGtFa0gKVExBV2JLcnNySVlIcTU2aGl2NVpCT0JEaHdQeVdKdXphLzF2dFJUTFRpZlJHOGlZNnVTNm9heG5TSzYxU01qUApZOWJsYVBsZVRUcFNUZ2RJVE5ESGVkdlVLUy9wT0dVUlYwUVNJQWE4N3RjbTBXUTA2Z3FONmVxcWhheXNKekxCClhjQk83V2ZOQWk5OFpVR0xQQ080MjUxSGRkeGRSa2RmbWx5VHp0Q0dCTzI1NzQxU0RrdUZGak96SnU4WkhHVkcKQjJON1VoVUNnWUVBMGwwUDRTVTUwM0E5aVhGTTBzK1NGdHdXcVlPTnRZalIvY0ttMU5vL2MvQlQ1VDNuaXAxOAo5UlNmOEVheWY0LzNBYlY3OUNjZXZ5RllYQks5RzZLK0tlcG9NZHNxZ0tiMUNBQlQ0RGxzamVYblhCRWdiUWxVCmw2RVFIZDU5TXNMcVc4Tjc4SFVhcjlWTEd1NU96RGVTU0FQWXZtZ2taRjVOVllPb2VaTDlFNE1DZ1lFQTZFSUQKd08wNS8rSHFrWnhBeTFkT0lEK0c0bzBuWUJVN08xOU9ueGlidW5uTys1OHZnOVlwRGlVZmh2ajk5SERUdjJqQwpsNERnMXoxMjkvMDIyMGI0YmNMSEFQb3BiR3BsR2RGc2hlSFptYmVuTld6Vit3TVppNGllYTlvc2xNcUN6bjIrCnFFeUw1ajlNODZPZytQZXNzOVo5MXJab1VVYldJaGc0aFJQbHo3OENnWUE1MjRDbmt0NkJxZWd5NmllUC82a1YKZ25qMUxJcUlPRlpSTGYxR283UTZCZ3A5RFhhbWFFUmEvODR4ZnJCUFoyQXZaeVB0ZGVqOTlvVGY1Z04vRzFhawpIcVdEdU56S3Y2QzdENlFDRXFrcHFlYmxLb3k1a0l4a205YmI4RHFOQUpFR3BoQnJoVG5PektJNGlQekJMRE9lCmZQaGEvamVzSjBlcjBtYys4TStNVXdLQmdRQ0s1WmZMRTlQQXhFRjhyUjVPdkxwN0xLS2s3OWRoYmJFTGs3YTQKREladElaVjRBejN1TVBCQ2hrN3hjQXluMTZXNmJaTVorYmY4NE1RNkVGTnpGV0ZTZXM1Nk5pRDV0ak1hR3BVMQpCOWtUUmJLWWo2cjBQMmxTZWZTTCtXRDU1cFlObVVPZzhJNGx0eXQwOVNFNll4d0VQTHpxNEJGSXNmMHpUSnJZCmN3clhqd0tCZ1FDUlprdWtnRGNrQlVvTzZxOVBDbWJjd1ZEOGJ6Sm1tWHR6MWh1bG9XNVI5ckJmNnA1LzhqczIKcnBCR25XWkZnQ2M4WjVOdVdDazJKODRaN0RvTVRsaThtMWJvM2JzcXFTRUx4UEJaeVlXUHcveGxqa1Jhc25pWgpCMjFwZHlHenJsSTNFY1BSN2VGMjU4RlRBUEF6MUJFRkdqVHRRZExzSTdTMW00akhKN2FtK3c9PQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQo=)
    cluster_ca_certificate = base64decode(LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM1ekNDQWMrZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJeU1ETXlOREUxTVRrMU0xb1hEVE15TURNeU1URTFNVGsxTTFvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTWFtCnROclZSR29pblk4alQvaDloU3pGaWc4dUJKaWFJWExZMGNFZHdacnUvaC9nUExwdE9qMXRxbDdZTGRYR2dBTTEKVjdLWjljYkUvSG9zU2VCYkEzWVZDaVpLQ2ZicEpZNGcxU3NJRnJoekVEYVIxOEJWVE9hR2FTYnVUT3NZaFJueApwUUJJS01oSlBYMytPVjA3SXphdXZkWlZrV1grQlV3SDR5eEx6Nll2Y3c0RXMva05ITzgzbS8yb2pqZ2FZZUFxClhWVWZDTmJmcFpVd0poekVkSHFiV3ZuRWlLUWlveDZsdFdQOWlZbE9UZXRzclcwNTEva2pJL1B4SnM0Y0pNbVEKYkVBZTJ4aGxLVWFqUUxWSVdQNTNOWDVqeXlJeHNqUGdzcFJ4RlB6dFhrcFU0Yk1wYmRsZ0tmMmdOd2xEUzh0SAo3UzJ2TTY3QnJwTnZONE04NHEwQ0F3RUFBYU5DTUVBd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZKeVN1WkxGTlNrS0NzOHhjM3lmeVRlYTlBcWpNQTBHQ1NxR1NJYjMKRFFFQkN3VUFBNElCQVFCaFU2MzNXRGZWMzZ1Qm9NODdjZ25qMmVJUEtrRDJBeFBFcHlLbGtHOExQbzdxRE5oRAovZENvVmtvbldNeEkvWGV5RVpMNktsbzlaR0MyR2xvOUdXY2NsUjhMWVU1SFZMUHFRbWtUcUpBYnlrY29vS0s2CmhMTWhBTFhoM2VjN3RqNHlXWlNoMnN5S2tvVW16bEhkdm9kZUs4UzRHRHlmc3lXN01qRzRZWGxxWi80LzNxSmYKNEdTazVEeUJUS1RWbjZpcjZvalExZDg3elRiemNXdlpNTUlGSlJvemNHeE5wQWY2VFh6SXFpNnhLelNsTTBIMAphc3NyejEvZllUK0FVeHYzK3VRcjM2aHlOTFcvUzJaSDN6VUN5OFJQZ3lHNmFqcmlJMWoxV3NsWHVYZjhBeWkvCjdrL2Zra0F1Vmx6dXJCUG1KYmdMeXVCT1FSOWRiRzl3VUhvWgotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==)
  }
}
