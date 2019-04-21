import axios from 'axios'

export function requestGetList(url, params) {
    return new Promise((resolve, reject) => {
        axios.get(url, {
            params,
        }).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })
}

export function requestGetDetail(url, id) {
    return new Promise((resolve, reject) => {
        axios.get(`${url}${id}/`).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })

}

export function requestPost(url, data) {
    return new Promise((resolve, reject) => {
        axios.post(url, data).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })

}

export function requestPut(url, id, data) {
    return new Promise((resolve, reject) => {
        axios.put(`${url}${id}/`, data).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })

}

export function requestPatch(url, id, data) {
    return new Promise((resolve, reject) => {
        axios.patch(`${url}${id}/`, {
            data,
        }).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })

}