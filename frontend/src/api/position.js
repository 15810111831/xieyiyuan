import {
    requestGetList
} from './request'


export function getPositionList(params) {
    return new Promise((resolve, reject) => {
        requestGetList('/users/api/position/', params).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })
}