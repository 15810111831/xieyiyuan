import {
    requestGetList
} from './request'


export function getGradeList(params) {
    return new Promise((resolve, reject) => {
        requestGetList('/tutor/api/grade/', params).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })
}