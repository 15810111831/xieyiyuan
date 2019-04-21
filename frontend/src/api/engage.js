import {
    requestPost,
    requestGetList,
    requestGetDetail
} from './request'

export function engagePost(data) {
    return new Promise((resolve, reject) => {
        requestPost('/tutor/api/engage/', data)
            .then(res => {
                resolve(res)
            }).catch(err => {
                reject(err)
            })
    })
}

export function engageDetail(id) {
    return new Promise((resolve, reject) => {
        requestGetDetail(`/tutor/api/engage/`, id)
            .then(res => {
                resolve(res)
            }).catch(err => {
                reject(err)
            })
    })
}

export function engageList(params) {
    return new Promise((resolve, reject) => {
        requestGetList(`/tutor/api/engage/`, params)
            .then(res => {
                resolve(res)
            }).catch(err => {
                reject(err)
            })
    })
}