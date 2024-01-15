import requests
from bs4 import BeautifulSoup

url = "https://docs.docker.com/desktop/install/ubuntu/"

def get_docker_deb_download_link(url):
    try:
        response = requests.get(url)
        response.raise_for_status()

        soup = BeautifulSoup(response.text, 'html.parser')

        links = soup.find_all('a')
        for link in links:
            if link.text.strip() == 'DEB package':
                return link.get('href')

        return None

    except requests.RequestException as e:
        return str(e)

if __name__ == "__main__":
    docker_deb_link = get_docker_deb_download_link(url)
    print(docker_deb_link)
