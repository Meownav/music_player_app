import requests

url = "https://saavn.dev/api/search/songs"

querystring = {"query":"Machi pani si"}

response = requests.get(url, params=querystring)

print(response.json()["data"]["total"])
print(response.json()["data"]["start"])
for i in range(len(response.json()["data"]["results"])):
    print(response.json()["data"]["results"][i]["name"])
print(response.json()["data"]["results"][0]["language"])
print(response.json()["data"]["results"][0]["downloadUrl"])


# print(response.json()["data"].keys())
